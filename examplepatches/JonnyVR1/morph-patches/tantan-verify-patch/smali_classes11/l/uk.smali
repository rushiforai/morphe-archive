.class public final synthetic Ll/uk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(ZZLcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/uk;->a:Z

    iput-boolean p2, p0, Ll/uk;->b:Z

    iput-object p3, p0, Ll/uk;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/uk;->d:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/uk;->a:Z

    iget-boolean v1, p0, Ll/uk;->b:Z

    iget-object v2, p0, Ll/uk;->c:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/uk;->d:Lkotlin/jvm/functions/Function0;

    invoke-static {v0, v1, v2, p0}, Ll/xk$a;->b(ZZLcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method
