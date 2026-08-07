.class public final synthetic Ll/jvm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ll/vwl;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ll/vwl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jvm;->a:Ljava/util/List;

    iput-object p2, p0, Ll/jvm;->b:Ll/vwl;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jvm;->a:Ljava/util/List;

    iget-object p0, p0, Ll/jvm;->b:Ll/vwl;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Ll/nvm;->g(Ljava/util/List;Ll/vwl;Ljava/lang/Boolean;)V

    return-void
.end method
