.class public final Ll/nku0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/fku0;

.field public final b:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/fku0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nku0;->a:Ll/fku0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/nku0;->b:Ll/kqx0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nku0;->b:Ll/kqx0;

    .line 2
    .line 3
    check-cast p0, Ll/pku0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/pku0;->a()Ll/zlu0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/zlu0;->c()Lorg/json/JSONObject;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
