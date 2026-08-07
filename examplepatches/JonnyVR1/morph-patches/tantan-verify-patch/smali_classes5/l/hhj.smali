.class public final synthetic Ll/hhj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ihj;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/ihj;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hhj;->a:Ll/ihj;

    iput-object p2, p0, Ll/hhj;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hhj;->a:Ll/ihj;

    iget-object p0, p0, Ll/hhj;->b:Ljava/util/List;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Ll/ihj;->d(Ll/ihj;Ljava/util/List;Ljava/lang/Long;)V

    return-void
.end method
