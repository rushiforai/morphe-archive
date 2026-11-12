.class public final Llck;
.super Lxgh;
.source "SourceFile"


# instance fields
.field public final b:Ljava/util/List;

.field public final c:Lcom/opera/android/OverlaidStatusBarDrawingView;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget v0, Lcom/opera/android/OverlaidStatusBarDrawingView;->g:I

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lcom/opera/android/OverlaidStatusBarDrawingView;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llck;->b:Ljava/util/List;

    iput-object p2, p0, Llck;->c:Lcom/opera/android/OverlaidStatusBarDrawingView;

    return-void
.end method
