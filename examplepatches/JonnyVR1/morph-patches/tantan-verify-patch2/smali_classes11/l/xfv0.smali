.class public final synthetic Ll/xfv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xuw0;


# instance fields
.field public final synthetic a:Ll/zfv0;

.field public final synthetic b:Ll/b7w0;

.field public final synthetic c:Ll/q6w0;


# direct methods
.method public synthetic constructor <init>(Ll/zfv0;Ll/b7w0;Ll/q6w0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xfv0;->a:Ll/zfv0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/xfv0;->b:Ll/b7w0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/xfv0;->c:Ll/q6w0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)Ll/hpr;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xfv0;->a:Ll/zfv0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xfv0;->b:Ll/b7w0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/xfv0;->c:Ll/q6w0;

    .line 6
    .line 7
    check-cast p1, Lorg/json/JSONArray;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p0, p1}, Ll/zfv0;->f(Ll/b7w0;Ll/q6w0;Lorg/json/JSONArray;)Ll/hpr;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
