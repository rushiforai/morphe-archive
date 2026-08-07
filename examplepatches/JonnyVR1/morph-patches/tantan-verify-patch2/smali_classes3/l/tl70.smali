.class public final synthetic Ll/tl70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xl70$d;

.field public final synthetic b:Ll/xc00;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/xl70$d;Ll/xc00;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tl70;->a:Ll/xl70$d;

    iput-object p2, p0, Ll/tl70;->b:Ll/xc00;

    iput-object p3, p0, Ll/tl70;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tl70;->a:Ll/xl70$d;

    iget-object v1, p0, Ll/tl70;->b:Ll/xc00;

    iget-object p0, p0, Ll/tl70;->c:Ljava/util/List;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, p0, p1}, Ll/xl70;->d(Ll/xl70$d;Ll/xc00;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method
