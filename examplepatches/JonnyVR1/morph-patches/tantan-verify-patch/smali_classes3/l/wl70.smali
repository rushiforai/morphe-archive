.class public final synthetic Ll/wl70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xc00;

.field public final synthetic b:Ll/xl70$d;

.field public final synthetic c:Ljava/util/List;

.field public final synthetic d:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/xc00;Ll/xl70$d;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wl70;->a:Ll/xc00;

    iput-object p2, p0, Ll/wl70;->b:Ll/xl70$d;

    iput-object p3, p0, Ll/wl70;->c:Ljava/util/List;

    iput-object p4, p0, Ll/wl70;->d:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wl70;->a:Ll/xc00;

    iget-object v1, p0, Ll/wl70;->b:Ll/xl70$d;

    iget-object v2, p0, Ll/wl70;->c:Ljava/util/List;

    iget-object p0, p0, Ll/wl70;->d:Ljava/util/List;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, v2, p0, p1}, Ll/xl70;->a(Ll/xc00;Ll/xl70$d;Ljava/util/List;Ljava/util/List;Ljava/lang/Throwable;)V

    return-void
.end method
