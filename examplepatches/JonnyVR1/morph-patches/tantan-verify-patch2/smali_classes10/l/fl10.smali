.class public final synthetic Ll/fl10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/il10;


# direct methods
.method public synthetic constructor <init>(Ll/il10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fl10;->a:Ll/il10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fl10;->a:Ll/il10;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/il10;->P3(Ll/il10;Ljava/util/List;)V

    return-void
.end method
