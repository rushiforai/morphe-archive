.class public Ll/hrc0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lv/VRecyclerView;

.field public final b:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final c:I

.field public d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Lv/VRecyclerView;Ll/y20;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lv/VRecyclerView;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/hrc0;->d:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/hrc0;->e:Z

    .line 9
    .line 10
    iput-object p1, p0, Ll/hrc0;->a:Lv/VRecyclerView;

    .line 11
    .line 12
    iput-object p2, p0, Ll/hrc0;->b:Ll/y20;

    .line 13
    .line 14
    iput p3, p0, Ll/hrc0;->c:I

    .line 15
    .line 16
    return-void
.end method
