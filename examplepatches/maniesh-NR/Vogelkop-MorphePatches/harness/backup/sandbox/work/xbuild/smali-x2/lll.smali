.class public final synthetic Llll;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Loll;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/widget/ThemeableLottieAnimationView;

.field public final synthetic c:Ldvb;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/widget/ThemeableLottieAnimationView;Ldvb;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 6

    iput-byte p5, p0, Llll;->a:B

    iput-object p1, p0, Llll;->b:Lcom/opera/android/widget/ThemeableLottieAnimationView;

    iput-object p2, p0, Llll;->c:Ldvb;

    iput-object p3, p0, Llll;->d:Ljava/lang/Object;

    iput-object p4, p0, Llll;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    iget-byte v0, p0, Llll;->a:B

    iget-object v1, p0, Llll;->e:Ljava/lang/Object;

    iget-object v2, p0, Llll;->d:Ljava/lang/Object;

    iget-object v3, p0, Llll;->c:Ldvb;

    iget-object p0, p0, Llll;->b:Lcom/opera/android/widget/ThemeableLottieAnimationView;

    packed-switch v0, :pswitch_data_26

    check-cast v1, Lykj;

    sget v0, Lcom/opera/android/widget/ThemeableLottieAnimationView;->x:I

    iget-object p0, p0, Ln2d;->d:Lf3d;

    new-instance v0, Li2d;

    const/4 v4, 0x0

    invoke-direct {v0, v1, v4}, Li2d;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v3, v2, v0}, Lf3d;->b(Ldvb;Ljava/lang/Object;Lua7;)V

    return-void

    :pswitch_1d
    check-cast v1, Lua7;

    sget v0, Lcom/opera/android/widget/ThemeableLottieAnimationView;->x:I

    invoke-virtual {p0, v3, v2, v1}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->x(Ldvb;Ljava/lang/Object;Lua7;)V

    return-void

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_1d
    .end packed-switch
.end method
