.class public final synthetic Ll/yt9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yt9;->a:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yt9;->a:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Lcom/p1/mobile/putong/data/Detect;

    invoke-static {p0, p1}, Ll/zt9;->a3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Detect;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
