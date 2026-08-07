.class public final synthetic Ll/baw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/android/app/Act;Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/baw;->a:Z

    iput-object p2, p0, Ll/baw;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/baw;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/baw;->d:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/baw;->a:Z

    iget-object v1, p0, Ll/baw;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/baw;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/baw;->d:Lkotlin/jvm/functions/Function0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/LoveBuzzEnvelope;

    invoke-static {v0, v1, v2, p0, p1}, Ll/haw;->q(ZLcom/p1/mobile/android/app/Act;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lcom/p1/mobile/putong/core/data/LoveBuzzEnvelope;)V

    return-void
.end method
