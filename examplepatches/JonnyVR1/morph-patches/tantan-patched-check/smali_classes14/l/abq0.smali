.class public final synthetic Ll/abq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/abq0;->a:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/abq0;->a:Ljava/lang/Runnable;

    check-cast p1, Lcom/p1/mobile/putong/account/data/ThirdPartVetify;

    invoke-static {p0, p1}, Ll/ccq0;->x0(Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/data/ThirdPartVetify;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
