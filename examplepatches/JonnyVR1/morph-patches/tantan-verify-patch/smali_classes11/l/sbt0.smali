.class public final synthetic Ll/sbt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bct0;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(ILjava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/sbt0;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/sbt0;->b:Ljava/util/Map;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Landroid/util/JsonWriter;)V
    .locals 1

    .line 1
    iget v0, p0, Ll/sbt0;->a:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/sbt0;->b:Ljava/util/Map;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Ll/cct0;->b(ILjava/util/Map;Landroid/util/JsonWriter;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
