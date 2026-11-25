"""Run native preference construction and the home deletion-prompt consumer."""
from rtl_vm import Reference
from n9292_vm import Fixture

STORE='Lru2;'
INIT='<init>(Landroid/content/SharedPreferences;Lqg9;Lqn8;)V'
HOME='Lnl/negentwee/ui/features/home/HomeViewModel;'
POPUP='shouldShowDeleteUserDataConfirmationPopup'
FUNCTIONAL='isFunctionalConsentGiven'
DELETE='shouldDeleteUserData'


class SavedConsentFixture(Fixture):
    def __init__(self,*args):
        super().__init__(*args)
        self.native.update({(STORE,INIT),(STORE,'I()Z')})
        for name,value in [('TRUE',True),('FALSE',False)]:
            self.statics['Ljava/lang/Boolean;->'+name+':Ljava/lang/Boolean;']=Reference(value,'Ljava/lang/Boolean;')
        self.statics['Lc9d;->a:Lc9d;']=self.new('Lc9d;')
        self.statics[STORE+'->m:[Ljl6;']=Reference([Reference(key,'Ljl6;') for key in [POPUP,DELETE,FUNCTIONAL]],'[Ljl6;')
        self.statics['Lju2;->DeleteUserData:Lju2;']=self.new('Lju2;')
        self.sdk_functional=True

    def invoke(self,target,args):
        if target in {'Lf6;-><init>(I)V','Ld6;-><init>(I)V','Lb6;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V','Le6;-><init>(Z)V'}:return None
        if target=='Lb6;->o(Lav5;Ljl6;)Ljava/lang/Object;':
            preferences=args[1].value[STORE+'->g:Landroid/content/SharedPreferences;'].value
            value=preferences.get(args[2].value,False if args[2].value!=POPUP else None)
            if value is None:return 0
            return Reference(value=='true' if isinstance(value,str) else bool(value),'Ljava/lang/Boolean;')
        if target=='Lb6;->z(Lav5;Ljl6;Ljava/lang/Object;)V':
            preferences=args[1].value[STORE+'->g:Landroid/content/SharedPreferences;'].value
            preferences[args[2].value]=args[3].value;return None
        if target=='Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;':
            return Reference({'preferences':args[0].value,'updates':{},'removals':set()},'Landroid/content/SharedPreferences$Editor;')
        if target=='Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;':
            args[0].value['removals'].add(args[1]);return args[0]
        if target=='Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;':
            args[0].value['updates'][args[1]]=bool(args[2]);return args[0]
        if target=='Landroid/content/SharedPreferences$Editor;->apply()V':
            edit=args[0].value
            for key in edit['removals']:edit['preferences'].pop(key,None)
            edit['preferences'].update(edit['updates']);return None
        if target=='Lqg9;->J(Z)V':self.events.append(('refresh',args[1]));return None
        if target=='Luu2;->e()Z':
            return self.run('Luu2;','e()Z',args)[0] if ('Luu2;','e()Z') in self.native else int(self.sdk_functional)
        if target=='Lc56;->c(Ljava/lang/Object;Ljava/lang/Object;)Z':
            unwrap=lambda value:value.value if isinstance(value,Reference) else value
            return int(unwrap(args[0])==unwrap(args[1]))
        if target=='Landroidx/lifecycle/l;->l(Ljava/lang/Object;)V':
            self.events.append((args[0].value['fixture-sink'],args[1]));return None
        if target=='Ljava/util/concurrent/ConcurrentHashMap;->clear()V':self.events.append(('clear-home-cache',));return None
        if target=='Llqe;->s(Lnld;)Ly72;':return self.new('Ly72;')
        if target=='Lyp5;-><init>(Lnl/negentwee/ui/features/home/HomeViewModel;Lkotlin/coroutines/Continuation;I)V':return None
        if target=='Llqe;->u(Lp13;Lcc;La38;Lw55;I)Ls86;':
            assert args[1] is self.statics['Lju2;->DeleteUserData:Lju2;']
            self.events.append(('explicit-delete-dispatch',));return self.new('Ls86;')
        return super().invoke(target,args)


def verify_saved_consent(f,selected):
    for popup in ['true',None,'false']:
        for local in [True,False]:
            for pending_delete in [False,True]:
                protected=object()
                values={FUNCTIONAL:local,DELETE:pending_delete,'savedTrips':protected}
                if popup is not None:values[POPUP]=popup
                preferences=Reference(values,'Landroid/content/SharedPreferences;')
                service=f.new(STORE);identity=f.new('Lqg9;');onboarding=f.new('Lqn8;')
                f.run(STORE,INIT,(service,preferences,identity,onboarding))
                assert service.value[STORE+'->h:Lqg9;'] is identity
                assert service.value[STORE+'->i:Lqn8;'] is onboarding
                assert values[DELETE] is pending_delete and values['savedTrips'] is protected,'9292 constructor changed explicit deletion or saved trips'
                if selected:
                    assert POPUP not in values,'9292 retains the stale delete-data popup flag'
                    assert values[FUNCTIONAL] is True,'9292 local functional consent is not initialized before home observes it'
                else:assert values.get(POPUP)==popup and values[FUNCTIONAL] is local
                assert f.run(STORE,'I()Z',(service,))[0]==int(True if selected else local)
                fields={HOME+'->q:Lru2;':service,HOME+'->m:Luu2;':f.new('Luu2;'),HOME+'->h:Lqg9;':identity,
                        HOME+'->A:Ljava/util/concurrent/ConcurrentHashMap;':f.new('Ljava/util/concurrent/ConcurrentHashMap;')}
                for name,sink in [('H','popup'),('z','home-completion'),('x','delete-progress')]:
                    fields[HOME+'->'+name+':La38;']=f.new('La38;',{'fixture-sink':sink})
                home=f.new(HOME,fields)
                # Exercise both stable consent and the transient SDK-denied state
                # between deny-all and enabling the functional service.
                for sdk in [False,True]:
                    f.sdk_functional=sdk;f.events.clear();f.run(HOME,'v()V',(home,))
                    kinds=[event[0] for event in f.events]
                    popup_expected=not sdk and not selected and popup=='true'
                    assert ('popup' in kinds)==popup_expected,'9292 native home consumer still opens the consent-revocation popup'
                    delete_expected=(selected or not sdk) and pending_delete and not popup_expected
                    assert ('explicit-delete-dispatch' in kinds)==delete_expected,'9292 changed explicit user-data deletion handling'
