.class public final synthetic Ll/o5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/t5;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/t5;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o5;->a:Ll/t5;

    iput-object p2, p0, Ll/o5;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o5;->a:Ll/t5;

    iget-object p0, p0, Ll/o5;->b:Ljava/util/List;

    invoke-static {v0, p0}, Ll/t5;->h(Ll/t5;Ljava/util/List;)V

    return-void
.end method
