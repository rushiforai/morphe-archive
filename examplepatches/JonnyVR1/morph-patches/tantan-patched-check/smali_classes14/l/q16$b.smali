.class public Ll/q16$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/q16;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Contact;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Contact;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic c:Ll/q16;


# direct methods
.method public constructor <init>(Ll/q16;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/q16$b;->c:Ll/q16;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ll/q16;Ll/r16;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Ll/q16$b;-><init>(Ll/q16;)V

    return-void
.end method
