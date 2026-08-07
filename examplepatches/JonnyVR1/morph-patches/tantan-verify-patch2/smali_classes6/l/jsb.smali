.class public final synthetic Ll/jsb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic a:Ljava/text/Collator;


# direct methods
.method public synthetic constructor <init>(Ljava/text/Collator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jsb;->a:Ljava/text/Collator;

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jsb;->a:Ljava/text/Collator;

    check-cast p1, Ll/nsb;

    check-cast p2, Ll/nsb;

    invoke-static {p0, p1, p2}, Ll/nsb;->a(Ljava/text/Collator;Ll/nsb;Ll/nsb;)I

    move-result p0

    return p0
.end method
