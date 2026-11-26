.class public LX/Ail9;
.super Ljava/lang/Object;

# Keep c() and the constructor native for JNI registration. Both Java task
# entry points install the pinned module without executing the remote loader.
.method public static synthetic b(LX/Ail9;)Ljava/lang/Object;
    .locals 2
    invoke-static {}, LX/n8;->a()Landroid/app/Application;
    move-result-object v0
    const-class v1, LX/iλ丑Λ主丟丂цچч丒τ中бФص主丵ض丏七乡丐Н;
    invoke-static {v0, v1}, LX/LocalStartupModule;->install(Landroid/app/Application;Ljava/lang/Class;)V
    const/4 v0, -0x1
    iput v0, p0, LX/Ail9;->a:I
    const/4 v0, 0x0
    return-object v0
.end method

.method public final d()V
    .locals 0
    invoke-static {p0}, LX/Ail9;->b(LX/Ail9;)Ljava/lang/Object;
    return-void
.end method
