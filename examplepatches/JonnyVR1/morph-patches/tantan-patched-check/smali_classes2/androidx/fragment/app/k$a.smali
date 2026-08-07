.class public final Landroidx/fragment/app/k$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/fragment/app/k;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:I

.field public b:Landroidx/fragment/app/Fragment;

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:Landroidx/lifecycle/Lifecycle$State;

.field public h:Landroidx/lifecycle/Lifecycle$State;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(ILandroidx/fragment/app/Fragment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Landroidx/fragment/app/k$a;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Landroidx/fragment/app/k$a;->b:Landroidx/fragment/app/Fragment;

    .line 7
    .line 8
    sget-object p1, Landroidx/lifecycle/Lifecycle$State;->RESUMED:Landroidx/lifecycle/Lifecycle$State;

    .line 9
    .line 10
    iput-object p1, p0, Landroidx/fragment/app/k$a;->g:Landroidx/lifecycle/Lifecycle$State;

    .line 11
    .line 12
    iput-object p1, p0, Landroidx/fragment/app/k$a;->h:Landroidx/lifecycle/Lifecycle$State;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(ILandroidx/fragment/app/Fragment;Landroidx/lifecycle/Lifecycle$State;)V
    .locals 0
    .param p2    # Landroidx/fragment/app/Fragment;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput p1, p0, Landroidx/fragment/app/k$a;->a:I

    .line 18
    iput-object p2, p0, Landroidx/fragment/app/k$a;->b:Landroidx/fragment/app/Fragment;

    .line 19
    iget-object p1, p2, Landroidx/fragment/app/Fragment;->mMaxState:Landroidx/lifecycle/Lifecycle$State;

    iput-object p1, p0, Landroidx/fragment/app/k$a;->g:Landroidx/lifecycle/Lifecycle$State;

    .line 20
    iput-object p3, p0, Landroidx/fragment/app/k$a;->h:Landroidx/lifecycle/Lifecycle$State;

    return-void
.end method
