"""Native typed collection and ad-entry checks; no Android/network success mock."""
from brabant_smali import canonical
from marktplaats_vm import RESPONSE,REQUEST,ITEM,TYPE,ORDER,SECTION,LIST
from rtl_vm import Reference,VmThrown

AD_TYPES=('SRP_HEADER_NATIVE_AD','SRP_LIST_NATIVE_AD','DISPLAY_BANNER')
RESPONSE_CTOR=''.join(('<init>(',LIST,'Lcom/horizon/android/core/datamodel/search/Histograms;',
 'Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Boolean;',
 'Lcom/horizon/android/feature/search/search/api/RecommendedCategoryDataDto;)V'))
ITEM_CTOR=''.join(('<init>(',TYPE,'Lcom/horizon/android/core/datamodel/CapiAd;'*3,
 'Lcom/horizon/android/core/datamodel/search/SellerHeaderInformation;',
 'Lcom/horizon/android/core/datamodel/nativead/NativeAdvertisement;',
 'Lcom/horizon/android/core/datamodel/search/SimilarItems;',
 'Lcom/horizon/android/core/datamodel/search/ShippingPromotion;',
 'Lcom/horizon/android/core/datamodel/search/GenAiPromotion;)V'))
REQUEST_CTOR='<init>('+LIST+LIST+'Lcom/horizon/android/feature/search/search/api/LrpSearchRequest;)V'


def verify_slots(f,hidden):
    types={name:f.enum(TYPE,name) for name in AD_TYPES}
    kept_names=('DEFAULT_LISTING','ICAS_TOPBLOCK_LISTING','ICAS_SIBLING_LISTING','SELLER_HEADER_INFORMATION','SIMILAR_ITEMS','DAC7_BANNER','KNN_INFO_BOX')
    def item(kind):
        value=f.new(ITEM);f.run(ITEM,ITEM_CTOR,(value,kind,*([0]*8)));return value
    ads=[item(kind) for kind in types.values()]
    kept=[item(f.enum(TYPE,name)) for name in kept_names]
    kept+=[item(0),0]  # malformed/unrecognized native data keeps its old semantics
    # Cached/reflection-populated fields can be written after a no-arg ctor.
    # Execute each actual read path, including the converter's direct field read.
    for rows in ([],ads,kept,ads+kept):
        raw=Reference(rows,'Ljava/util/ArrayList;')
        value=f.new(RESPONSE,{RESPONSE+'->items:'+LIST:raw})
        wanted=[row for row in rows if not hidden or row not in ads]
        for sig in ('getItems()'+LIST,'component1()'+LIST):
            result=f.run(RESPONSE,sig,(value,))[0]
            assert result.value==wanted,'Marktplaats populated field bypassed ad policy'
        sig='toAdSearchResult()Lcom/horizon/android/core/datamodel/search/AdSearchResult;'
        code=canonical(f.source.body(RESPONSE,sig)).code
        boundary=next(i for i,line in enumerate(code) if line=='const/4 v2, 0x0')
        _,frame=f.run(RESPONSE,sig,(value,),stop_at=(boundary,))
        assert frame['v1'].value==wanted,'Marktplaats converter bypassed ad policy'
        assert raw.value is rows and all(a is b for a,b in zip(raw.value,rows))
    metadata=[f.new('Lcom/horizon/android/core/datamodel/search/Histograms;'),
        Reference(True,'Ljava/lang/Boolean;'),'fixture-correlation',Reference(False,'Ljava/lang/Boolean;'),
        f.new('Lcom/horizon/android/feature/search/search/api/RecommendedCategoryDataDto;')]
    fields=('searchHistograms:Lcom/horizon/android/core/datamodel/search/Histograms;',
        'bigViewAllowed:Ljava/lang/Boolean;','correlationId:Ljava/lang/String;',
        'hasErrors:Ljava/lang/Boolean;','recommendCategoryData:Lcom/horizon/android/feature/search/search/api/RecommendedCategoryDataDto;')
    for items in ([],ads,kept,ads[:1]+kept+ads[1:],kept+ads):
        original=Reference(items,'Ljava/util/ArrayList;');expected=[row for row in items if not hidden or row not in ads]
        for mode in ('primary','mask','copy','default-copy'):
            value=f.new(RESPONSE)
            f.run(RESPONSE,RESPONSE_CTOR,(value,original,*metadata))
            if mode=='mask':
                value=f.new(RESPONSE)
                sig=RESPONSE_CTOR[:-2]+'ILkotlin/jvm/internal/DefaultConstructorMarker;)V'
                f.run(RESPONSE,sig,(value,original,*metadata,0,0))
            elif mode=='copy':
                sig=RESPONSE_CTOR.replace('<init>','copy').replace(')V',')'+RESPONSE)
                value=f.run(RESPONSE,sig,(value,original,*metadata))[0]
            elif mode=='default-copy':
                sig='copy$default('+RESPONSE+RESPONSE_CTOR.split('(',1)[1][:-2]+'ILjava/lang/Object;)'+RESPONSE
                value=f.run(RESPONSE,sig,(value,0,*([0]*5),0x3f,0))[0]
            result=f.run(RESPONSE,'getItems()'+LIST,(value,))[0]
            assert result.value==expected and all(a is b for a,b in zip(result.value,expected)),'Marktplaats explicit display/native rows remain'
            assert f.run(RESPONSE,'component1()'+LIST,(value,))[0] is result,'Marktplaats component bypassed ad policy'
            assert original.value is items and all(original.value[i] is row for i,row in enumerate(items))
            if not hidden or not any(row in ads for row in items):assert result is original,'Marktplaats copied unaffected search data'
            for field,wanted in zip(fields,metadata):assert value.value[RESPONSE+'->'+field] is wanted,'Marktplaats changed response metadata'
    for noarg in (False,True):
        value=f.new(RESPONSE)
        f.run(RESPONSE,'<init>()V' if noarg else RESPONSE_CTOR,(value,) if noarg else (value,0,*metadata))
        assert f.run(RESPONSE,'getItems()'+LIST,(value,))[0]==0,'Marktplaats changed nullable response semantics'
    values=[f.run(TYPE,'getValue()Ljava/lang/String;',(kind,))[0] for kind in types.values()]
    keep_values=[f.run(TYPE,'getValue()Ljava/lang/String;',(f.enum(TYPE,name),))[0] for name in kept_names]
    supported=Reference(values+keep_values+[None,'UNKNOWN_FUTURE_TYPE','display_banner '],'Ljava/util/ArrayList;')
    segments=Reference(['fixture-segment'],'Ljava/util/ArrayList;');query=f.new('Lcom/horizon/android/feature/search/search/api/LrpSearchRequest;')
    request=f.new(REQUEST);f.run(REQUEST,REQUEST_CTOR,(request,supported,segments,query))
    result=f.run(REQUEST,'getSupportedTypes()'+LIST,(request,))[0]
    assert result.value==([v for v in supported.value if v not in values] if hidden else supported.value),'Marktplaats still advertises ad capabilities'
    assert f.run(REQUEST,'getUserSegments()'+LIST,(request,))[0] is segments
    assert f.run(REQUEST,'getSearchRequest()Lcom/horizon/android/feature/search/search/api/LrpSearchRequest;',(request,))[0] is query
    for broken in (1,3):
        args=[f.new(REQUEST),supported,segments,query];args[broken]=0
        try:f.run(REQUEST,REQUEST_CTOR,args)
        except VmThrown as e:assert e.value.descriptor=='Ljava/lang/NullPointerException;'
        else:raise AssertionError('Marktplaats lost request validation')
    banner=f.enum(SECTION,'DISPLAY_BANNER')
    orders=[value for key,value in f.statics.items() if key.startswith(ORDER+'->') and key.endswith(':'+ORDER)]
    assert orders,'Missing native VIP content orders'
    for order in orders:
        for field,method in [('phoneSections','getPhoneSections$vip'),('tabletSections','getTabletSections$vip')]:
            original=order.value[ORDER+'->'+field+':'+LIST]
            wanted=[value for value in original.value if not hidden or value is not banner]
            result=f.run(ORDER,method+'()'+LIST,(order,))[0]
            assert result.value==wanted and all(a is b for a,b in zip(result.value,wanted)),'Marktplaats VIP display section remains'
            if len(wanted)==len(original.value):assert result is original


def verify_ad_init(f,hidden):
    for owner,sig,needle in [('Lc37;','c()V','Lmzj;->c()Lmzj;'),
        ('Lc37;','d()V','Lcom/pubmatic/sdk/'),
        ('Lc1c;','a(Landroid/content/Context;)V','Lorg/prebid')]:
        code=canonical(f.source.body(owner,sig)).code
        boundary=next(i for i,line in enumerate(code) if needle in line)
        args=() if owner=='Lc37;' else (f.new('Lc1c;'),f.new('Landroid/content/Context;'))
        result=f.run(owner,sig,args,stop_at=(boundary,))[0]
        assert result==(None if hidden else boundary),'Marktplaats advertising SDK entry remains reachable'
