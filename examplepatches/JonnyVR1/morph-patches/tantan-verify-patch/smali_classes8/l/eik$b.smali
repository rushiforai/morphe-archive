.class public Ll/eik$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/eik;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:Lv/VText;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:Lv/VEditText;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:Lv/VImage;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lv/VText;Lv/VEditText;Lv/VImage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/eik$b;->a:Lv/VText;

    .line 5
    .line 6
    iput-object p2, p0, Ll/eik$b;->b:Lv/VEditText;

    .line 7
    .line 8
    iput-object p3, p0, Ll/eik$b;->c:Lv/VImage;

    .line 9
    .line 10
    return-void
.end method
