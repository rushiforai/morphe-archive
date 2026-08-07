.class Ll/tkw$b$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/tkw$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:Landroid/widget/ImageView;

.field public b:Landroid/widget/TextView;

.field final synthetic c:Ll/tkw$b;


# direct methods
.method private constructor <init>(Ll/tkw$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tkw$b$a;->c:Ll/tkw$b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ll/tkw$b;Ll/tkw$a;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Ll/tkw$b$a;-><init>(Ll/tkw$b;)V

    return-void
.end method
