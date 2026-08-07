.class public final synthetic Ll/xbw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/SVGAClickAreaListener;


# instance fields
.field public final synthetic a:Ljava/util/Set;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Set;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xbw;->a:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public final onClick(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xbw;->a:Ljava/util/Set;

    invoke-static {p0, p1}, Ll/fcw;->E(Ljava/util/Set;Ljava/lang/String;)V

    return-void
.end method
