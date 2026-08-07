.class public final synthetic Ll/oae0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/abe0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/abe0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oae0;->a:Ll/abe0;

    iput-object p2, p0, Ll/oae0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/oae0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/oae0;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/oae0;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/oae0;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/oae0;->a:Ll/abe0;

    iget-object v1, p0, Ll/oae0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/oae0;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/oae0;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/oae0;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/oae0;->f:Ljava/lang/String;

    invoke-static/range {v0 .. v5}, Ll/qae0;->f(Ll/abe0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
