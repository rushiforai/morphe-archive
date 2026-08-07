.class public Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$ActionType;

.field public b:I


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$ActionType;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$a;->b:I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$a;->a:Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$ActionType;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$ActionType;I)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$a;->a:Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$ActionType;

    .line 12
    iput p2, p0, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$a;->b:I

    return-void
.end method
