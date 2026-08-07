.class public final synthetic Ll/qkz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/clz;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/clz;Ljava/util/List;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qkz;->a:Ll/clz;

    iput-object p2, p0, Ll/qkz;->b:Ljava/util/List;

    iput-object p3, p0, Ll/qkz;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qkz;->a:Ll/clz;

    iget-object v1, p0, Ll/qkz;->b:Ljava/util/List;

    iget-object p0, p0, Ll/qkz;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/clz;->P1(Ll/clz;Ljava/util/List;Ljava/lang/String;)V

    return-void
.end method
