"""Only these Comscore bridge prefixes may differ from original method graphs."""
from brabant_smali import canonical
from tvgids_comscore_android_vm import ANALYTICS, CONFIG, STREAM, LISTENER, METHOD


def prefix(owner, signature, code):
    replacement = canonical('.locals 4\n'+code).code
    return dict(owner=owner, signature=signature, index=0, original=[], replacement=replacement)


COMSCORE_EDITS = [
    prefix(ANALYTICS, METHOD, '''
        iget-object v0, p1, Lin3;->a:Ljava/lang/String;
        const-string v1, "getVersion"
        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-nez v1, :version
        const-string v1, "getLogLevel"
        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-nez v1, :level
        const-string v0, "tracking_disabled"
        const-string v1, "Comscore measurement is disabled"
        const/4 v2, 0x0
        invoke-interface {p2, v0, v1, v2}, Lln3;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
        return-void
        :version
        const-string v0, ""
        invoke-interface {p2, v0}, Lln3;->success(Ljava/lang/Object;)V
        return-void
        :level
        const/4 v0, 0x0
        invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
        move-result-object v0
        invoke-interface {p2, v0}, Lln3;->success(Ljava/lang/Object;)V
        return-void
    '''),
    prefix(CONFIG, METHOD, '''
        iget-object v0, p1, Lin3;->a:Ljava/lang/String;
        const-string v1, "isEnabled"
        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-nez v1, :disabled
        const-string v0, "tracking_disabled"
        const-string v1, "Comscore configuration is disabled"
        const/4 v2, 0x0
        invoke-interface {p2, v0, v1, v2}, Lln3;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
        return-void
        :disabled
        const/4 v0, 0x0
        invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
        move-result-object v0
        invoke-interface {p2, v0}, Lln3;->success(Ljava/lang/Object;)V
        return-void
    '''),
    prefix(STREAM, 'onListen(Ljava/lang/Object;Ltj1;)V', '''
        check-cast p2, Luj1;
        invoke-virtual {p2}, Luj1;->morpheEndOfStream()V
        return-void
    '''),
    prefix(STREAM, 'onCancel(Ljava/lang/Object;)V', f'''
        iget-object p0, p0, {STREAM}->this$0:{CONFIG}
        const/4 p1, 0x0
        invoke-static {{p0, p1}}, {CONFIG}->f({CONFIG}Ltj1;)V
        return-void
    '''),
    *[prefix(owner, signature, 'return-void') for owner, signature in (
        (STREAM, 'lambda$onListen$0()V'),
        (LISTENER, 'lambda$onCrossPublisherUniqueDeviceIdChanged$0(Ljava/lang/String;)V'),
        (LISTENER, 'onCrossPublisherUniqueDeviceIdChanged(Ljava/lang/String;)V'),
    )],
]
