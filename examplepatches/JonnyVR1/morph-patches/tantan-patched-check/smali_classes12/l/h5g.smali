.class public Ll/h5g;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/h5g$a;
    }
.end annotation


# instance fields
.field private final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private b:Ll/h5g$a;


# direct methods
.method public constructor <init>(Ll/h5g$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/h5g;->a:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/h5g;->b:Ll/h5g$a;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a()Ll/h5g$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h5g;->b:Ll/h5g$a;

    .line 2
    .line 3
    return-object p0
.end method
