.class public final synthetic Ll/e04;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/g04;

.field public final synthetic b:Ljava/util/Map$Entry;


# direct methods
.method public synthetic constructor <init>(Ll/g04;Ljava/util/Map$Entry;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e04;->a:Ll/g04;

    iput-object p2, p0, Ll/e04;->b:Ljava/util/Map$Entry;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e04;->a:Ll/g04;

    iget-object p0, p0, Ll/e04;->b:Ljava/util/Map$Entry;

    check-cast p1, Ljava/util/Map$Entry;

    invoke-static {v0, p0, p1}, Ll/g04;->q1(Ll/g04;Ljava/util/Map$Entry;Ljava/util/Map$Entry;)V

    return-void
.end method
