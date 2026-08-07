.class public final synthetic Ll/bhk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jek$b;


# instance fields
.field public final synthetic a:Ll/chk;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/chk;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bhk;->a:Ll/chk;

    iput-object p2, p0, Ll/bhk;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/util/List;Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bhk;->a:Ll/chk;

    iget-object p0, p0, Ll/bhk;->b:Ljava/lang/String;

    invoke-static {v0, p0, p1, p2, p3}, Ll/chk;->a(Ll/chk;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method
