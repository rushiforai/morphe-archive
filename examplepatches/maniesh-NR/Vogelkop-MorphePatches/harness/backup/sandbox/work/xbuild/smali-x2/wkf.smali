.class public final Lwkf;
.super Landroid/graphics/drawable/Drawable$ConstantState;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public final d:Lbp;

.field public final e:Lbp;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 34
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    .line 35
    new-instance v0, Lbp;

    const/16 v1, 0x15

    invoke-direct {v0, v1}, Lbp;-><init>(B)V

    iput-object v0, p0, Lwkf;->d:Lbp;

    .line 36
    new-instance v0, Lbp;

    invoke-direct {v0, v1}, Lbp;-><init>(B)V

    iput-object v0, p0, Lwkf;->e:Lbp;

    return-void
.end method

.method public constructor <init>(Lwkf;)V
    .registers 4

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    iget v0, p1, Lwkf;->a:I

    iput v0, p0, Lwkf;->a:I

    iget v0, p1, Lwkf;->b:I

    iput v0, p0, Lwkf;->b:I

    iget v0, p1, Lwkf;->c:I

    iput v0, p0, Lwkf;->c:I

    new-instance v0, Lbp;

    iget-object v1, p1, Lwkf;->d:Lbp;

    invoke-direct {v0, v1}, Lbp;-><init>(Lbp;)V

    iput-object v0, p0, Lwkf;->d:Lbp;

    new-instance v0, Lbp;

    iget-object p1, p1, Lwkf;->e:Lbp;

    invoke-direct {v0, p1}, Lbp;-><init>(Lbp;)V

    iput-object v0, p0, Lwkf;->e:Lbp;

    return-void
.end method


# virtual methods
.method public final getChangingConfigurations()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final newDrawable()Landroid/graphics/drawable/Drawable;
    .registers 3

    new-instance v0, Lcom/opera/android/graphics/OperaGradientDrawable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/opera/android/graphics/OperaGradientDrawable;-><init>(Lwkf;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0
.end method
