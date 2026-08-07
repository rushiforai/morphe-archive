.class public final synthetic Ll/uso;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vto;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/vto;Ljava/util/List;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uso;->a:Ll/vto;

    iput-object p2, p0, Ll/uso;->b:Ljava/util/List;

    iput-object p3, p0, Ll/uso;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uso;->a:Ll/vto;

    iget-object v1, p0, Ll/uso;->b:Ljava/util/List;

    iget-object p0, p0, Ll/uso;->c:Ljava/lang/String;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1}, Ll/vto;->T(Ll/vto;Ljava/util/List;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
