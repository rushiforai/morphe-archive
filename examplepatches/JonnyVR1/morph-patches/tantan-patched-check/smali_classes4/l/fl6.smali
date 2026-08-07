.class public final synthetic Ll/fl6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/gl6;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/util/List;

.field public final synthetic d:Ljava/util/List;

.field public final synthetic e:Ljava/util/List;

.field public final synthetic f:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/gl6;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fl6;->a:Ll/gl6;

    iput-object p2, p0, Ll/fl6;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/fl6;->c:Ljava/util/List;

    iput-object p4, p0, Ll/fl6;->d:Ljava/util/List;

    iput-object p5, p0, Ll/fl6;->e:Ljava/util/List;

    iput-object p6, p0, Ll/fl6;->f:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/fl6;->a:Ll/gl6;

    iget-object v1, p0, Ll/fl6;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/fl6;->c:Ljava/util/List;

    iget-object v3, p0, Ll/fl6;->d:Ljava/util/List;

    iget-object v4, p0, Ll/fl6;->e:Ljava/util/List;

    iget-object v5, p0, Ll/fl6;->f:Ljava/util/List;

    invoke-static/range {v0 .. v5}, Ll/gl6;->a(Ll/gl6;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method
