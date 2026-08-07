.class public Ll/v3f$c;
.super Ll/v3f$b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/v3f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<O:",
        "Ljava/lang/Object;",
        ">",
        "Ll/v3f$b<",
        "Ll/vxj0;",
        "TO;>;"
    }
.end annotation


# instance fields
.field final synthetic i:Ll/v3f;


# direct methods
.method public constructor <init>(Ll/v3f;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/v3f$c;->i:Ll/v3f;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Ll/v3f$b;-><init>(Ll/v3f;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public p()V
    .locals 1

    .line 1
    sget-object v0, Ll/vxj0;->a:Ll/vxj0;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/v3f$b;->j(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    sget-object v0, Ll/vxj0;->a:Ll/vxj0;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/v3f$b;->m(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
