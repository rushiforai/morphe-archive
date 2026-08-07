.class public final synthetic Ll/gsv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/isv0;


# instance fields
.field public final synthetic a:Ll/hsv0;

.field public final synthetic b:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ll/hsv0;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gsv0;->a:Ll/hsv0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/gsv0;->b:Ljava/util/ArrayList;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gsv0;->a:Ll/hsv0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/gsv0;->b:Ljava/util/ArrayList;

    .line 4
    .line 5
    check-cast p1, Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Ll/hsv0;->b(Ljava/util/ArrayList;Landroid/os/Bundle;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
