.class public final synthetic Ll/e0z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/u1z;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/util/List;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/u1z;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e0z;->a:Ll/u1z;

    iput-object p2, p0, Ll/e0z;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/e0z;->c:Ljava/util/List;

    iput-object p4, p0, Ll/e0z;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/e0z;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/e0z;->a:Ll/u1z;

    iget-object v1, p0, Ll/e0z;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/e0z;->c:Ljava/util/List;

    iget-object v3, p0, Ll/e0z;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/e0z;->e:Ljava/lang/String;

    move-object v5, p1

    check-cast v5, Ljava/lang/Boolean;

    invoke-static/range {v0 .. v5}, Ll/u1z;->y0(Ll/u1z;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method
