.class public final synthetic Ll/ovc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Lkotlin/text/Regex;

.field public final synthetic b:Ljava/lang/CharSequence;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lkotlin/text/Regex;Ljava/lang/CharSequence;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ovc0;->a:Lkotlin/text/Regex;

    iput-object p2, p0, Ll/ovc0;->b:Ljava/lang/CharSequence;

    iput p3, p0, Ll/ovc0;->c:I

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ovc0;->a:Lkotlin/text/Regex;

    iget-object v1, p0, Ll/ovc0;->b:Ljava/lang/CharSequence;

    iget p0, p0, Ll/ovc0;->c:I

    invoke-static {v0, v1, p0}, Lkotlin/text/Regex;->a(Lkotlin/text/Regex;Ljava/lang/CharSequence;I)Lkotlin/text/MatchResult;

    move-result-object p0

    return-object p0
.end method
