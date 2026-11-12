.class public final synthetic Lkll;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Loll;


# instance fields
.field public final synthetic a:Lcom/opera/android/widget/ThemeableLottieAnimationView;

.field public final synthetic b:Ldvb;

.field public final synthetic c:Ljava/lang/Integer;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/widget/ThemeableLottieAnimationView;Ldvb;Ljava/lang/Integer;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkll;->a:Lcom/opera/android/widget/ThemeableLottieAnimationView;

    iput-object p2, p0, Lkll;->b:Ldvb;

    iput-object p3, p0, Lkll;->c:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    sget v0, Lcom/opera/android/widget/ThemeableLottieAnimationView;->x:I

    iget-object v0, p0, Lkll;->a:Lcom/opera/android/widget/ThemeableLottieAnimationView;

    iget-object v0, v0, Ln2d;->d:Lf3d;

    const/4 v1, 0x0

    iget-object v2, p0, Lkll;->b:Ldvb;

    iget-object p0, p0, Lkll;->c:Ljava/lang/Integer;

    invoke-virtual {v0, v2, p0, v1}, Lf3d;->b(Ldvb;Ljava/lang/Object;Lua7;)V

    return-void
.end method
