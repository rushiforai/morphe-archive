.class public final synthetic Ll/u8i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/x8i;


# direct methods
.method public synthetic constructor <init>(Ll/x8i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u8i;->a:Ll/x8i;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u8i;->a:Ll/x8i;

    check-cast p1, Ljava/util/Map;

    invoke-static {p0, p1}, Ll/x8i;->i(Ll/x8i;Ljava/util/Map;)V

    return-void
.end method
