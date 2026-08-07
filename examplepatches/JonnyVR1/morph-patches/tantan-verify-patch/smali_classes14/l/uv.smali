.class public Ll/uv;
.super Ll/ovd0;
.source "SourceFile"


# instance fields
.field public a:Ll/wyd0;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/ovd0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wyd0;

    .line 5
    .line 6
    const-string v1, "fake_client_id"

    .line 7
    .line 8
    const-string v2, "100032"

    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/uv;->a:Ll/wyd0;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method
