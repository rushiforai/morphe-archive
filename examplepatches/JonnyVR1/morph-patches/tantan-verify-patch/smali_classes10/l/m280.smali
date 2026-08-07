.class public final synthetic Ll/m280;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/n280$a;


# direct methods
.method public synthetic constructor <init>(Ll/n280$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m280;->a:Ll/n280$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m280;->a:Ll/n280$a;

    invoke-static {p0}, Ll/n280$a;->i(Ll/n280$a;)V

    return-void
.end method
