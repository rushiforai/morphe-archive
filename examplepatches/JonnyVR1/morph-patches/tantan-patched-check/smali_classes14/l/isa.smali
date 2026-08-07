.class public final synthetic Ll/isa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/usa;

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ll/usa;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/isa;->a:Ll/usa;

    iput-object p2, p0, Ll/isa;->b:Ljava/util/ArrayList;

    iput-object p3, p0, Ll/isa;->c:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/isa;->a:Ll/usa;

    iget-object v1, p0, Ll/isa;->b:Ljava/util/ArrayList;

    iget-object p0, p0, Ll/isa;->c:Ljava/util/ArrayList;

    invoke-static {v0, v1, p0}, Ll/usa;->s3(Ll/usa;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    return-void
.end method
