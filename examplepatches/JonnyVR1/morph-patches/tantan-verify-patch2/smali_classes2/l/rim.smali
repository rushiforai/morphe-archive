.class public Ll/rim;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qim;


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:Ll/qvb0;

.field public final e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(IIILl/qvb0;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III",
            "Ll/qvb0;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/rim;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/rim;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/rim;->c:I

    .line 9
    .line 10
    iput-object p4, p0, Ll/rim;->d:Ll/qvb0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/rim;->e:Ljava/util/Map;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getExtras()Ljava/util/Map;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rim;->e:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Ll/rim;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Ll/rim;->a:I

    .line 2
    .line 3
    return p0
.end method
