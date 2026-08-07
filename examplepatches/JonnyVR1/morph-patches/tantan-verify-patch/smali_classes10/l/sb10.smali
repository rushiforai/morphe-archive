.class public final synthetic Ll/sb10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sb10;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/sb10;->b:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sb10;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/sb10;->b:Lkotlin/jvm/functions/Function0;

    invoke-static {v0, p0}, Ll/vb10;->i(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method
