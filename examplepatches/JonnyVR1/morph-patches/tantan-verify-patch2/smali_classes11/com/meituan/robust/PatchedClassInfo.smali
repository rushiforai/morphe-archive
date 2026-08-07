.class public Lcom/meituan/robust/PatchedClassInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public patchClassName:Ljava/lang/String;

.field public patchedClassName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/meituan/robust/PatchedClassInfo;->patchedClassName:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/meituan/robust/PatchedClassInfo;->patchClassName:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method
