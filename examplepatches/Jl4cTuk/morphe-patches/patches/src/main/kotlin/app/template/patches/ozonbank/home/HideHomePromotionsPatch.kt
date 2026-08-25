package app.template.patches.ozonbank.home

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.ozonbank.shared.Constants.COMPATIBILITY_OZON_BANK_CURRENT

private const val USER_FLAGS_MODULE_URL =
    "https://cdn2.ozone.ru/s3/bozon-fe-self-service/release/apps/self-service/" +
        "_app/immutable/chunks/B5qmCoOl.js"

private val hidePromotionsScript = """
    (function(){
      if(window.__morpheOzonBankHomePromotions){return;}
      window.__morpheOzonBankHomePromotions=true;
      var forceClassicHomeDesign=function(){
        if(window.__morpheOzonBankClassicHomeDesign){return;}
        window.__morpheOzonBankClassicHomeDesign='loading';
        import('$USER_FLAGS_MODULE_URL').then(async function(userFlagsModule){
          var store=userFlagsModule.g();
          var flagKind=userFlagsModule.O.DISABLED_MAIN_REDESIGN;
          var current=await store.getFlag(flagKind,true);
          if(current&&current.value===true){
            window.__morpheOzonBankClassicHomeDesign='enabled';
            return;
          }
          var updated=await store.setFlag(flagKind,true);
          if(updated&&updated.value===true){
            window.__morpheOzonBankClassicHomeDesign='reloading';
            window.location.reload();
            return;
          }
          window.__morpheOzonBankClassicHomeDesign='not-updated';
        }).catch(function(){
          window.__morpheOzonBankClassicHomeDesign='error';
        });
      };
      var normalize=function(value){return (value||'').replace(/\\s+/g,' ').replace(/\\s+₽/g,'₽').trim();};
      var hasRoute=function(route){
        var path=(window.location&&window.location.pathname||'').toLowerCase();
        return path===route||path.indexOf(route+'/')===0;
      };
      var isHomePage=function(){return hasRoute('/m/lk/main');};
      var isBenefitPage=function(){return hasRoute('/m/lk/bonus');};
      var benefitSectionTitles=['Розыгрыши и акции','Бонусы за рекомендации','Купить за 1₽','Выгода от партнёров','Для покупок на Ozon','Ozon Premium'];
      var protectsStructure=function(element){
        if(!element){return false;}
        var text=normalize(element.textContent);
        var hasQuickActions=text.indexOf('QR-код')!==-1&&text.indexOf('Пополнить')!==-1&&text.indexOf('Перевести')!==-1;
        return text.indexOf('Основной счёт')!==-1||text.indexOf('Последние операции')!==-1||hasQuickActions;
      };
      var protectsUserContent=function(element){
        return protectsStructure(element)||normalize(element&&element.textContent).indexOf('₽')!==-1;
      };
      var hide=function(element){
        if(element&&!protectsUserContent(element)){element.style.setProperty('display','none','important');}
      };
      var hidePromo=function(element){
        if(element&&!protectsStructure(element)){element.style.setProperty('display','none','important');}
      };
      var signature=function(element){
        var parts=[element.textContent,element.getAttribute('aria-label'),element.getAttribute('title'),element.getAttribute('data-testid'),element.getAttribute('href')];
        Array.prototype.forEach.call(element.querySelectorAll('img,svg,use'),function(asset){
          parts.push(asset.getAttribute('alt'),asset.getAttribute('src'),asset.getAttribute('href'),asset.getAttribute('xlink:href'),asset.getAttribute('aria-label'));
        });
        return normalize(parts.filter(Boolean).join(' ')).toLowerCase();
      };
      var leaves=function(text){
        return Array.prototype.filter.call(document.querySelectorAll('body *'),function(element){
          if(normalize(element.textContent).indexOf(text)===-1){return false;}
          for(var i=0;i<element.children.length;i++){
            if(normalize(element.children[i].textContent).indexOf(text)!==-1){return false;}
          }
          return true;
        });
      };
      var hideProduct=function(element){
        var clickable=element.closest('a,button,[role=button],[role=link]');
        if(clickable&&!protectsUserContent(clickable)){
          var clickableRect=clickable.getBoundingClientRect();
          var clickableCard=clickableRect.width>=window.innerWidth*0.2&&clickableRect.width<=window.innerWidth*0.7&&clickableRect.height>=40&&clickableRect.height<=240;
          var clickableRow=clickableRect.width>=window.innerWidth*0.75&&clickableRect.height>=25&&clickableRect.height<=110;
          if(clickableCard||clickableRow){hide(clickable);return;}
        }
        var current=element;
        var best=null;
        var semanticBest=element;
        while(current&&current!==document.body){
          if(protectsUserContent(current)){break;}
          semanticBest=current;
          var rect=current.getBoundingClientRect();
          var card=rect.width>=window.innerWidth*0.2&&rect.width<=window.innerWidth*0.7&&rect.height>=40&&rect.height<=240;
          var row=rect.width>=window.innerWidth*0.75&&rect.height>=25&&rect.height<=110;
          if(card||row){best=current;}
          current=current.parentElement;
        }
        hide(best||semanticBest||element);
      };
      var hideWide=function(element){
        var current=element;
        var best=null;
        while(current&&current!==document.body){
          var rect=current.getBoundingClientRect();
          if(rect.width>=window.innerWidth*0.75&&rect.height>=45&&rect.height<=220){best=current;}
          if(rect.height>300){break;}
          current=current.parentElement;
        }
        hide(best||element.closest('a,button,[role=button],[role=link]')||element);
      };
      var hideWidePromo=function(element){
        var current=element;
        var best=null;
        while(current&&current!==document.body){
          if(protectsStructure(current)){break;}
          var rect=current.getBoundingClientRect();
          if(rect.width>=window.innerWidth*0.75&&rect.height>=45&&rect.height<=220){best=current;}
          if(rect.height>300){break;}
          current=current.parentElement;
        }
        hidePromo(best||element);
      };
      var hideApiMarketingBanners=function(){
        Array.prototype.forEach.call(
          document.querySelectorAll('[data-testid^=banner-type-]'),
          hideWidePromo
        );
      };
      var findQuickActions=function(){
        var qrLeaves=leaves('QR-код');
        for(var i=0;i<qrLeaves.length;i++){
          var current=qrLeaves[i];
          while(current&&current!==document.body){
            var text=normalize(current.textContent);
            if(text.indexOf('Пополнить')!==-1&&text.indexOf('Перевести')!==-1){return current;}
            current=current.parentElement;
          }
        }
        return null;
      };
      var hidePromoCarousel=function(){
        var quickActions=findQuickActions();
        var operationLeaves=leaves('Последние операции');
        if(!quickActions||operationLeaves.length===0){return;}
        var quickRect=quickActions.getBoundingClientRect();
        var operationsTop=operationLeaves[0].getBoundingClientRect().top;
        for(var i=1;i<operationLeaves.length;i++){
          operationsTop=Math.min(operationsTop,operationLeaves[i].getBoundingClientRect().top);
        }
        var target=null;
        var targetArea=0;
        Array.prototype.forEach.call(document.querySelectorAll('body *'),function(element){
          if(element===quickActions||protectsStructure(element)){return;}
          var rect=element.getBoundingClientRect();
          var inPromoBand=rect.top>=quickRect.bottom+4&&rect.top<=quickRect.bottom+260;
          var beforeOperations=rect.bottom<=operationsTop+1;
          var promoSize=rect.width>=window.innerWidth*0.75&&rect.height>=45&&rect.height<=220;
          var hasContent=normalize(element.textContent).length>0||element.querySelector('img,svg,button,a,[role=button],[role=link]');
          if(!inPromoBand||!beforeOperations||!promoSize||!hasContent){return;}
          var area=rect.width*rect.height;
          if(area>targetArea){target=element;targetArea=area;}
        });
        hidePromo(target);
      };
      var containsOtherBenefitSection=function(text,title){
        for(var i=0;i<benefitSectionTitles.length;i++){
          if(benefitSectionTitles[i]!==title&&text.indexOf(benefitSectionTitles[i])!==-1){return true;}
        }
        return false;
      };
      var hideBenefitSection=function(title){
        var pageAnchors=leaves('Выгода за покупки');
        if(pageAnchors.length===0){pageAnchors=leaves('Выгода сейчас');}
        if(pageAnchors.length===0){return;}
        var pageAnchor=pageAnchors[0];
        leaves(title).forEach(function(element){
          if((pageAnchor.compareDocumentPosition(element)&4)===0){return;}
          var current=element;
          var best=null;
          while(current&&current!==document.body){
            if(current.contains(pageAnchor)){break;}
            var text=normalize(current.textContent);
            if(containsOtherBenefitSection(text,title)){break;}
            var rect=current.getBoundingClientRect();
            if(rect.width>=window.innerWidth*0.75&&rect.height>=80&&rect.height<=520){best=current;}
            if(rect.height>520){break;}
            current=current.parentElement;
          }
          hidePromo(best||element);
        });
      };
      var hideGiftButton=function(){
        var controls=Array.prototype.filter.call(document.querySelectorAll('a,button,[role=button],[role=link]'),function(element){
          var rect=element.getBoundingClientRect();
          return rect.width>=28&&rect.width<=90&&rect.height>=28&&rect.height<=90&&rect.left>=window.innerWidth*0.6&&rect.top>=0&&rect.top<=160;
        });
        for(var i=0;i<controls.length;i++){
          var controlSignature=signature(controls[i]);
          if(controlSignature.indexOf('gift')!==-1||controlSignature.indexOf('подар')!==-1){hidePromo(controls[i]);return;}
        }
        controls.sort(function(left,right){return left.getBoundingClientRect().left-right.getBoundingClientRect().left;});
        if(controls.length<2){return;}
        var searchCandidate=controls[controls.length-1];
        var searchRect=searchCandidate.getBoundingClientRect();
        for(var j=controls.length-2;j>=0;j--){
          var giftCandidate=controls[j];
          var giftRect=giftCandidate.getBoundingClientRect();
          var sameRow=Math.abs((giftRect.top+giftRect.bottom)-(searchRect.top+searchRect.bottom))<=40;
          var adjacent=searchRect.left-giftRect.right>=0&&searchRect.left-giftRect.right<=80;
          if(sameRow&&adjacent){hidePromo(giftCandidate);return;}
        }
      };
      var sweep=function(){
        if(isHomePage()){
          forceClassicHomeDesign();
          var pageText=normalize(document.body&&document.body.textContent);
          if(pageText.indexOf('Основной счёт')!==-1){leaves('Новый счёт или продукт').forEach(hideProduct);}
          hideApiMarketingBanners();
          hidePromoCarousel();
          leaves('Увеличивайте накопления').forEach(hideWide);
          hideGiftButton();
        }
        if(isBenefitPage()){
          hideBenefitSection('Розыгрыши и акции');
          hideBenefitSection('Бонусы за рекомендации');
        }
      };
      var queued=false;
      var schedule=function(){
        if(queued){return;}
        queued=true;
        window.requestAnimationFrame(function(){queued=false;sweep();});
      };
      var start=function(){
        if(!document.body){return;}
        new MutationObserver(schedule).observe(document.body,{childList:true,subtree:true,characterData:true});
        sweep();
      };
      if(document.body){start();}else{document.addEventListener('DOMContentLoaded',start,{once:true});}
    })();
""".trimIndent().replace("\n", " ")

@Suppress("unused")
val hideOzonBankPromotionsPatch = bytecodePatch(
    name = "Hide Ozon Bank promotions",
    description =
        "Uses the classic home design and removes promotional cards, sections, shortcuts, " +
            "and the startup installment offer from Ozon Bank pages.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_OZON_BANK_CURRENT)

    execute {
        ShowCbottomBridgeHandleSyncFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
                invoke-virtual {p2, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
                move-result-object v0
                const-string/jumbo v1, "деньги в рассрочку"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v0
                if-eqz v0, :morphe_allow_ozon_bank_cbottom
                new-instance v0, Lru/ozon/fintech/features/finwebview/domain/nativebridge/NativeResult${'$'}Success;
                const-string/jumbo v1, "{\"success\":true}"
                invoke-direct {v0, v1}, Lru/ozon/fintech/features/finwebview/domain/nativebridge/NativeResult${'$'}Success;-><init>(Ljava/lang/String;)V
                return-object v0
                :morphe_allow_ozon_bank_cbottom
                nop
            """.trimIndent(),
        )

        FintechWebViewPageFinishedFingerprint.method.addInstructions(
            0,
            """
                const-string/jumbo v0, "$hidePromotionsScript"
                const/4 v1, 0x0
                invoke-virtual {p1, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
            """.trimIndent(),
        )
    }
}
