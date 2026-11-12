.class public final synthetic Lclf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Loll;


# instance fields
.field public final synthetic a:Lcom/opera/android/custom_views/OperaIntroView;

.field public final synthetic b:Lflf;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/custom_views/OperaIntroView;Lflf;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lclf;->a:Lcom/opera/android/custom_views/OperaIntroView;

    iput-object p2, p0, Lclf;->b:Lflf;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 5

    sget v0, Lcom/opera/android/custom_views/OperaIntroView;->F:I

    iget-object v0, p0, Lclf;->b:Lflf;

    iget v1, v0, Lflf;->e:F

    const/4 v2, 0x0

    cmpl-float v2, v1, v2

    iget-object p0, p0, Lclf;->a:Lcom/opera/android/custom_views/OperaIntroView;

    if-lez v2, :cond_20

    iget v2, v0, Lflf;->d:F

    iget-object v3, p0, Lcom/opera/android/custom_views/OperaIntroView;->E:Ljava/lang/Float;

    if-nez v3, :cond_1b

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iput-object v3, p0, Lcom/opera/android/custom_views/OperaIntroView;->E:Ljava/lang/Float;

    iput v2, p0, Lcom/opera/android/custom_views/OperaIntroView;->D:F

    :cond_1b
    iget v2, v0, Lflf;->f:I

    invoke-virtual {p0, v1, v2}, Lcom/opera/android/custom_views/OperaIntroView;->E(FI)V

    :cond_20
    iget v0, v0, Lflf;->c:I

    if-eqz v0, :cond_27

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/OperaIntroView;->C(I)V

    :cond_27
    iget-object v0, p0, Ln2d;->j:Ljava/util/HashSet;

    sget-object v1, Ll2d;->f:Ll2d;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Ln2d;->d:Lf3d;

    invoke-virtual {p0}, Lf3d;->n()V

    return-void
.end method
