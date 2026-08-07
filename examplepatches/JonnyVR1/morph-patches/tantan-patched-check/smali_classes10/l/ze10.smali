.class public final synthetic Ll/ze10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ze10;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ze10;->a:Ljava/lang/String;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/bf10;->c(Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method
