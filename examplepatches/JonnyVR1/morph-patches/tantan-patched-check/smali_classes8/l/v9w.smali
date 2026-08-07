.class public final synthetic Ll/v9w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/v9w;->a:Z

    iput-object p2, p0, Ll/v9w;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/v9w;->c:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/v9w;->a:Z

    iget-object v1, p0, Ll/v9w;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/v9w;->c:Lkotlin/jvm/functions/Function0;

    invoke-static {v0, v1, p0}, Ll/haw;->i(ZLcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
