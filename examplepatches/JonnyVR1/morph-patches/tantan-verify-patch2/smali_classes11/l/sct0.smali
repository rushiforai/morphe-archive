.class public final Ll/sct0;
.super Ll/tct0;
.source "SourceFile"


# instance fields
.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/tct0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/sct0;->b:Ljava/lang/Object;

    .line 5
    .line 6
    return-void
.end method

.method public static d(Ljava/lang/Object;)Ll/sct0;
    .locals 1

    .line 1
    new-instance v0, Ll/sct0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/sct0;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public final e()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sct0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/tct0;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method
