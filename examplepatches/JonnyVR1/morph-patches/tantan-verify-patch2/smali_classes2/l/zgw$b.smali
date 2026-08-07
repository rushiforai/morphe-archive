.class public Ll/zgw$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w4d0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/zgw;->w(Ll/hsb$a;)Ll/fb5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/w4d0<",
        "TV;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/hsb$a;

.field public final synthetic b:Ll/zgw;


# direct methods
.method public constructor <init>(Ll/zgw;Ll/hsb$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zgw$b;->b:Ll/zgw;

    .line 2
    .line 3
    iput-object p2, p0, Ll/zgw$b;->a:Ll/hsb$a;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public release(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Ll/zgw$b;->b:Ll/zgw;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zgw$b;->a:Ll/hsb$a;

    .line 4
    .line 5
    invoke-static {p1, p0}, Ll/zgw;->h(Ll/zgw;Ll/hsb$a;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
