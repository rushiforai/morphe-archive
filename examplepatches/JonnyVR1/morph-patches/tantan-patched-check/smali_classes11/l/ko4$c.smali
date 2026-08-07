.class public final Ll/ko4$c;
.super Ll/sdg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ko4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation


# instance fields
.field public f:Ll/lid$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/lid$a<",
            "Ll/ko4$c;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/lid$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/lid$a<",
            "Ll/ko4$c;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/sdg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ko4$c;->f:Ll/lid$a;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final u()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ko4$c;->f:Ll/lid$a;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ll/lid$a;->a(Ll/lid;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
