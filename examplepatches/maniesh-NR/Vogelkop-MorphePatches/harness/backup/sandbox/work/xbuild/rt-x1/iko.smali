.class public final Liko;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:I


# instance fields
.field public final a:Landroid/widget/FrameLayout;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    invoke-static {}, Landroid/view/View;->generateViewId()I

    move-result v0

    sput v0, Liko;->b:I

    return-void
.end method

.method public constructor <init>(Landroid/widget/FrameLayout;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Liko;->a:Landroid/widget/FrameLayout;

    return-void
.end method
