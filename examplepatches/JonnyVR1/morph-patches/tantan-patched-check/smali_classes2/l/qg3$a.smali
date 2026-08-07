.class public Ll/qg3$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/qg3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<I:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public a:Ll/qg3$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qg3$a<",
            "TI;>;"
        }
    .end annotation
.end field

.field public b:I

.field public c:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "TI;>;"
        }
    .end annotation
.end field

.field public d:Ll/qg3$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qg3$a<",
            "TI;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/qg3$a;ILjava/util/LinkedList;Ll/qg3$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qg3$a<",
            "TI;>;I",
            "Ljava/util/LinkedList<",
            "TI;>;",
            "Ll/qg3$a<",
            "TI;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qg3$a;->a:Ll/qg3$a;

    .line 5
    .line 6
    iput p2, p0, Ll/qg3$a;->b:I

    .line 7
    .line 8
    iput-object p3, p0, Ll/qg3$a;->c:Ljava/util/LinkedList;

    .line 9
    .line 10
    iput-object p4, p0, Ll/qg3$a;->d:Ll/qg3$a;

    .line 11
    .line 12
    return-void
.end method

.method public synthetic constructor <init>(Ll/qg3$a;ILjava/util/LinkedList;Ll/qg3$a;Ll/rg3;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2, p3, p4}, Ll/qg3$a;-><init>(Ll/qg3$a;ILjava/util/LinkedList;Ll/qg3$a;)V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "LinkedEntry(key: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget p0, p0, Ll/qg3$a;->b:I

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, ")"

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method
