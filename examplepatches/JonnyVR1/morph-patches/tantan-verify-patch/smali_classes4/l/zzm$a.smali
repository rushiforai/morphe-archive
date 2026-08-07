.class public Ll/zzm$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/zzm;->A()I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/zzm;


# direct methods
.method public constructor <init>(Ll/zzm;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zzm$a;->a:Ll/zzm;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public call()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->LIVE_PUSH:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->getOnlyName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget-object v2, Lcom/p1/mobile/android/ui/poplevel/PopAction;->OTHER_ACTION:Lcom/p1/mobile/android/ui/poplevel/PopAction;

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/ui/poplevel/a;->o(Ljava/lang/String;Lcom/p1/mobile/android/ui/poplevel/PopAction;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/zzm$a;->a:Ll/zzm;

    .line 17
    .line 18
    invoke-static {p0}, Ll/zzm;->I(Ll/zzm;)Ll/a0n;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ll/a0n;->f()V

    .line 23
    .line 24
    .line 25
    return-void
.end method
