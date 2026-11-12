.class public final Lio3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfck;


# instance fields
.field public final synthetic a:Lcom/opera/android/bar/BottomBar;


# direct methods
.method public constructor <init>(Lcom/opera/android/bar/BottomBar;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio3;->a:Lcom/opera/android/bar/BottomBar;

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 1

    iget-object p0, p0, Lio3;->a:Lcom/opera/android/bar/BottomBar;

    iget-object p0, p0, Lcom/opera/android/bar/BottomBar;->c:Lap3;

    iget-object p0, p0, Lap3;->a:Lzo3;

    iget p0, p0, Lzo3;->a:I

    return p0
.end method

.method public final getView()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lio3;->a:Lcom/opera/android/bar/BottomBar;

    return-object p0
.end method
